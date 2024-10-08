
# In this block the code determines the minimum CPU platform based on the machine type that the use has selected. 
# We always recommend our customers to use the latest generation of Intel CPU platforms that are publicly available . 
# 
# As of October 2024, C4 and N4 are powered by the 5th generation Intel Xeon Scalable processor (code-named Emerald Rapids) and will offer better performance over the C3 and N2 instances.
# 
# General Purpose N2 instances can be on either Ice Lake or Cascade Lake for the same price. For better price and performance, we are recommendaing to use Intel Ice Lake for N2 instances. For C3 instances, the 
# minimum CPU platform is Intel Sapphire Rapids. 
# 
# The C3 instances are Sapphire Rapids and will have even better performance over the C2 instances. For M3 instances, the minimum CPU platform is Intel Ice Lake. 
# For C2 instances, the minimum CPU platform is Intel Cascade Lake. For the other instance types that are available on older generation Intel CPUs, we are not populating the min CPU platform. 
# We are using the default CPU platform that GCP will provide for these older generation of instances


locals {
  machine_type_regex = "^([cemn][1234u])"
  machine_types = {
    "n2": "Intel Ice Lake",
    "c3": "Intel Sapphire Rapids",
    "m3": "Intel Ice Lake",
    "c2": "Intel Cascade Lake"
    "n4": null
    "c4": null
    "n1": null
    "m1": null
    "m2": null
    "e2": null
    "cu": null
  }
  min_cpu_platform = lookup(local.machine_types,one(regex(local.machine_type_regex, var.machine_type)),null)
}

data "google_compute_image" "image" {
  family  = var.boot_image_family
  project = var.boot_image_project
}

resource "google_compute_instance" "instance" {

  # General options
  name           = var.name
  description    = var.description
  zone           = var.zone
  tags           = var.tags
  hostname       = var.hostname
  desired_status = var.desired_status
  project        = var.project != null ? var.project : null
 
  # Machine configuration options
  machine_type              = var.machine_type
  allow_stopping_for_update = var.allow_stopping_for_update

  #inject cloud-init and other user_data, if applicable
  metadata = {
    user-data = var.user_data
  }

  dynamic "service_account" {
    for_each = var.service_account == null ? [] : [var.service_account]
    content {
      email  = lookup(service_account.value, "service_email", null)
      scopes = lookup(service_account.value, "scopes", null)
    }
  }

 #Required for optional Intel Confidential Compute with TDX
confidential_instance_config {
    enable_confidential_compute = var.enable_confidential_compute
    confidential_instance_type  = var.confidential_instance_type
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

    dynamic "access_config" {
      for_each = var.access_config
      content {
        nat_ip                 = access_config.value.nat_ip
        public_ptr_domain_name = access_config.value.public_ptr_domain_name
        network_tier           = access_config.value.network_tier
      }
    }

    dynamic "ipv6_access_config" {
      for_each = var.ipv6_access_config != [] ? var.ipv6_access_config : []
      content {
        public_ptr_domain_name = lookup(ipv6_access_config.value, "public_ptr_domain_name", null)
        network_tier           = lookup(ipv6_access_config.value, "network_tier", null)
      }
    }
  }

  # CPU platform and GPU options
  min_cpu_platform = local.min_cpu_platform

  # Boot disk options
  deletion_protection = var.deletion_protection

  boot_disk {
    auto_delete             = var.boot_disk_auto_delete
    mode                    = var.boot_disk_mode
    disk_encryption_key_raw = var.boot_disk_byo_encryption_key
    source                  = var.boot_disk_source

    initialize_params {
      image  = data.google_compute_image.image.self_link
      size   = var.boot_disk_size
      type   = var.boot_disk_type
      labels = var.boot_disk_labels
    }
  }

  scheduling {
    preemptible                 = var.preemptible
    automatic_restart           = var.preemptible ? false : var.automatic_restart
    on_host_maintenance         = var.on_host_maintenance
    provisioning_model          = var.preemptible ? "SPOT" : var.provisioning_model
    instance_termination_action = var.termination_action
  }

  advanced_machine_features {
    enable_nested_virtualization = var.enable_nested_virtualization
    threads_per_core             = var.threads_per_core
    visible_core_count           = var.visible_core_count
  }

  lifecycle {
    create_before_destroy = "true"
  }

  shielded_instance_config {
    enable_secure_boot          = var.enable_secure_boot
    enable_vtpm                 = var.enable_vtpm
    enable_integrity_monitoring = var.enable_integrity_monitoring
  }
}
