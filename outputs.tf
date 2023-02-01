
# output "ip_address" {
#   value = google_compute_instance.example.network_interface
# }

# output "instance_name" {
#   value = google_compute_instance.example.hostname
# }

# output "tags" {
#   value = google_compute_instance.example.tags
# }

# output "description" {
#   value = google_compute_instance.example.description
# }

# output "instance_id" {
#   value = google_compute_instance.example.instance_id
# }

# output "guest_accelerator" {
#   value = google_compute_instance.example.guest_accelerator
# }

# output "attached_disk" {
#   value = google_compute_instance.example.attached_disk
# }

output "disk_type" {
  value       = google_compute_instance.test-vm-instance.boot_disk[0].initialize_params[0].type
  description = "Disk type that was configured when the VM was created."
}

output "disk_size" {
  value       = google_compute_instance.test-vm-instance.boot_disk[0].initialize_params[0].type
  description = "Disk type that was configured when the VM was created."
}


output "name" {
  value       = google_compute_instance.test-vm-instance.name
  description = "Name of the VM that has been created."
}

output "hostname" {
  value       = google_compute_instance.test-vm-instance.hostname
  description = "Name of the VM that has been created."
}

output "machine_type" {
  value       = google_compute_instance.test-vm-instance.machine_type
  description = "Instance type that was used for the VM deployment."
}


# Output creation
output "instance" {
  value = google_compute_instance.test-vm-instance
}