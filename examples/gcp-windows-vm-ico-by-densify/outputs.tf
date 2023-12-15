output "cpu_platform" {
  value       = module.windows_vm.cpu_platform
  description = "The CPU platform of the VM instance"
}

output "current_status" {
  value       = module.windows_vm.current_status
  description = "Current status of the VM instance"
}

output "id" {
  value       = module.windows_vm.id
  description = "An identifier for the resource"
}

output "instance_id" {
  value       = module.windows_vm.instance_id
  description = "The server-assigned unique identifier of this instance"
}

output "machine_type" {
  value       = module.densify.instance_type
  description = "Type of the machine created"
}

output "min_cpu_platform" {
  value       = module.windows_vm.min_cpu_platform
  description = "Minimum CPU platform for the VM instance"
}

output "name" {
  value       = module.windows_vm.name
  description = "Unique name of the instance created"
}

output "self_link" {
  value       = module.windows_vm.self_link
  description = "The URI of the created resource"
}

output "boot_disk_size" {
  value       = module.windows_vm.boot_disk_size
  description = "Size of the boot disk of the instance"
}


















