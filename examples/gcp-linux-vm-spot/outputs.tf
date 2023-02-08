output "cpu_platform" {
  value       = module.spot-vm.cpu_platform
  description = "The CPU platform of the VM instance"
}

output "current_status" {
  value       = module.spot-vm.current_status
  description = "Current status of the VM instance"
}

output "id" {
  value       = module.spot-vm.id
  description = "An identifier for the resource"
}

output "instance_id" {
  value       = module.spot-vm.instance_id
  description = "The server-assigned unique identifier of this instance"
}

output "machine_type" {
  value       = module.spot-vm.machine_type
  description = "Type of the machine created"
}

output "min_cpu_platform" {
  value       = module.spot-vm.min_cpu_platform
  description = "Minimum CPU platform for the VM instance"
}

output "name" {
  value       = module.spot-vm.name
  description = "Unique name of the instance created"
}

output "self_link" {
  value       = module.spot-vm.self_link
  description = "The URI of the created resource"
}

output "boot_disk_size" {
  value       = module.spot-vm.boot_disk_size
  description = "Size of the boot disk of the instance"
}


















