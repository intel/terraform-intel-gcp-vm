
output "ip_address" {
  value = google_compute_instance.example.network_interface.0.access_config.0.nat_ip
}

output "instance_name" {
    value = google_compute_instance.example.hostname
}

output "boot_disk" {
    value = google_compute_instance.example.boot_disk
}

output "tags" {
    value = google_compute_instance.example.tags
}

output "description" {
    value = google_compute_instance.example.description
}

output "instance_id" {
    value = google_compute_instance.example.instance_id
}

output "guest_accelerator" {
    value = google_compute_instance.example.guest_accelerator
}

output "attached_disk" {
    value = google_compute_instance.example.attached_disk
}