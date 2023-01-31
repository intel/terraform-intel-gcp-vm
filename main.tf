data "google_compute_image" "image" {
  family = var.boot_image_family
  project = var.image_project
}

resource "google_compute_instance" "test-vm-instance" {
  
  # General options
  name         = var.name
  description  = var.description
  zone         = var.zone
  tags         = var.tags
  hostname     = var.hostname
  desired_status = var.desired_status
  project      = var.project
  #TODO evaluate DNS configuration if required


  # Machine configuration options
  machine_type = var.machine_type
  allow_stopping_for_update = var.stop_for_update

  dynamic "service_account" {
    for_each = var.service_account == null ? [] : [var.service_account]
    content {
      email = lookup(service_account.value, "service_email", null)
      scopes = lookup(service_account.value, "scopes", null)
    }
  }

  # CPU platform and GPU options
  min_cpu_platform = var.min_cpu_platform
  # Display device options

  # Container options

  # Boot disk options
  deletion_protection = var.deletion_protection

  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
      size = var.boot_disk_size
      type = var.boot_disk_type
      # labels = {
      #   my_label = "value"
      # }
    }
  }

# variable "additional_networks" {
#   description = "Additional network interface details for GCE, if any."
#   default     = []
#   type = list(object({
#     network            = string
#     subnetwork         = string
#     subnetwork_project = string
#     network_ip         = string
#     access_config = list(object({
#       nat_ip       = string
#       network_tier = string
#     }))
#     ipv6_access_config = list(object({
#       network_tier = string
#     }))
#   }))
# }


  # Identity and API options

  # Firewall options

  # Advanced options
  # Advanced networking options
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  # Advanced disks options

  # Advanced management options

  # Advanced sole tenancy options
  
}