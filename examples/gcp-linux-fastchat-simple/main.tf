resource "random_id" "rid" {
  byte_length = 3
}

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
  name                = "intel-fastchat-${random_id.rid.dec}"
  zone                = "us-central1-a"
  machine_type        = "c4-standard-32"
  allow_stopping_for_update = true	  
  tags                = ["fschat-${random_id.rid.dec}"]
  user_data           = templatefile("./cloud_init.yml", {})
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

resource "google_compute_firewall" "rules" {
  project     =  var.project
  name        = "fastchat-firewall-${random_id.rid.dec}"
  network     = "default"
  description = "Allows access to FastChat Webserver."
  
  allow {
    protocol  = "tcp"
    ports     = ["22", "5000", "5001", "7860"]
  }
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = ["fschat-${random_id.rid.dec}"]
}
