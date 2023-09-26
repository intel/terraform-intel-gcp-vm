variable "project" {
  type        = string
  description = "GCP Project ID"
}


#GCP Linux VM with Intel Cloud Optimized Recipe for FastChat
module "linux_vm" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-fastchat"
  zone                = "us-central1-a"
  machine_type        = "c3-standard-44"  
  tags                = ["fschat"]
  user_data           = templatefile("./cloud_init.yml", {})
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

resource "google_compute_firewall" "rules" {
  project     =  var.project
  name        = "fastchat-firewall"
  network     = "default"
  description = "Allows access to FastChat Webserver."

  allow {
    protocol  = "tcp"
    ports     = ["7860"]
  }
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = ["fschat"]
}
