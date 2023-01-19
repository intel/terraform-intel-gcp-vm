resource "google_compute_instance" "josh-hashitest" {
  name         = "josh-hashitestmain"
  machine_type = "n2-standard-2"
  min_cpu_platform = "Intel Ice Lake"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"
  }
}
