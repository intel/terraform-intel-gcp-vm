data "google_compute_image" "image" {
  family  = var.boot_image_family
  project = var.boot_image_project
}

resource "google_compute_instance" "test-vm-instance" {

  # General options
  name           = var.name
  description    = var.description
  zone           = var.zone
  tags           = var.tags
  hostname       = var.hostname
  desired_status = var.desired_status
  project        = var.project != null ? var.project : null

  #TODO evaluate DNS configuration if required


  # Machine configuration options
  machine_type              = var.machine_type
  allow_stopping_for_update = var.allow_stopping_for_update

  dynamic "service_account" {
    for_each = var.service_account == null ? [] : [var.service_account]
    content {
      email  = lookup(service_account.value, "service_email", null)
      scopes = lookup(service_account.value, "scopes", null)
    }
  }

  # Networking
  can_ip_forward = var.can_ip_forward
  network_interface {
    network            = var.network
    subnetwork         = var.subnetwork
    subnetwork_project = var.subnetwork_project
    network_ip         = var.network_ip
    nic_type           = var.nic_type
    stack_type         = var.stack_type
    access_config {
      // Ephemeral public IP
    }
  }

  # CPU platform and GPU options
  min_cpu_platform = var.min_cpu_platform


  # Guest Acceleration
  # TODO: Guest acceleration has been postponed until it is supported on Ice Lake. Currently supported on Cascade Lake. See issues for updates

  #TODO: confidential_instance_config block only applies to AMD so the block has been omitted

  # Boot disk options
  deletion_protection = var.deletion_protection

  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
      size  = var.boot_disk_size
      type  = var.boot_disk_type
      # labels = {
      #   my_label = "value"
      # }
    }
  }

  scheduling {
    preemptible         = var.preemptible
    automatic_restart   = var.preemptible ? false : var.automatic_restart
    on_host_maintenance = var.preemptible ? false : var.on_host_maintenance
    provisioning_model  = var.preemptible ? "SPOT" : var.provisioning_model
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

}