output "name" {
  value       = module.rhel_vm.cpu_platform
  description = "A unique name for the resource, required by GCE. Changing this forces a new resource to be created."
}

output "instance_id" {
  value       = module.rhel_vm.instance_id
  description = "The server-assigned unique identifier of this instance"
}

output "boot_disk_family" {
  value       = module.rhel_vm.boot_disk_size
  description = "The image from which to initialize this disk"
}

output "boot_disk_project" {
  value       = module.rhel_vm.boot_disk_size
  description = "The ID of the project in which the source image resides."
}

output "tags" {
  value       = module.rhel_vm.machine_type
  description = "A list of network tags to attach to the instance"
}

















