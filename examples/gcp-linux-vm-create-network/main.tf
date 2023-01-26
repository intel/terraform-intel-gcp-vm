provider "google" {
  version = "3.55.0"
  project = "intel-csa-resource-gcp"
  region  = "us-central1"
}

resource "google_compute_instance" "josh-hashitest" {
  name         = "josh-hashitest"
  machine_type = "n2-standard-2"
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
