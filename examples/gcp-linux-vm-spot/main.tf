resource "google_compute_instance" "my_spot_instance" {
  name         = "my-spot-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  scheduling {
    preemptible = true
    on_host_maintenance = "terminate"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
}
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }