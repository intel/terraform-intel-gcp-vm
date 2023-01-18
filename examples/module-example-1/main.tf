provider "google" {
  version = "3.55.0"
  project = "intel-csa-resource-gcp"
  region  = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "my-vm"
  machine_type = "f1-micro"
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
