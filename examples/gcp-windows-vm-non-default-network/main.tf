
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "my-subnetwork"
  network       = google_compute_network.my_network.self_link
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
}

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  network_interface {
    network    = google_compute_network.my_network.name
    subnetwork = google_compute_subnetwork.my_subnetwork.name
    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
}