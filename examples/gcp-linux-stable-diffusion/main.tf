variable "project" {
  type        = string
  description = "GCP Project ID"
}


#GCP Linux VM with Intel Cloud Optimized Recipe for Stable Diffusion
module "linux_vm" {
  source              = "../../" #"intel/gcp-vm/intel"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-stable-diffusion-test"
  zone                = "us-central1-a"
  machine_type        = "c3-highcpu-44"  
  tags                = ["stable-diffusion-intel"]
  user_data           = templatefile("./cloud_init.yml", {})
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

# Grants access to VM Public IP on Port 9000, http://<VM_PLUBLIC_IP>:9000
resource "google_compute_firewall" "rules" {
  project     =  var.project
  name        = "stable-diffusion-firewall"
  network     = "default"
  description = "Allows access to Stable Diffusion Webserver."

  allow {
    protocol  = "tcp"
    ports     = ["9000"]
  }
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = ["stable-diffusion-intel"]
}
