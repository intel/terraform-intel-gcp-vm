#Random ID to minimize the chances of name conflicts
resource "random_id" "rid" {
  byte_length = 3
}

#GCP Linux VM with Intel OPEA Code Generation 
module "linux_vm" {
  source                    = "intel/gcp-vm/intel"
  project                   = var.project
  boot_image_project        = "ubuntu-os-cloud"
  boot_image_family         = "ubuntu-2204-lts"
  name                      = "ai-opea-codegen-${random_id.rid.dec}"
  zone                      = "us-east4-a"
  machine_type              = "c4-highcpu-48"
  allow_stopping_for_update = true
  tags                      = ["ai-opea-codegen-${random_id.rid.dec}"]
  user_data                 = templatefile("./cloud_init.yml", { HUGGINGFACEHUB_API_TOKEN = var.huggingface_token })
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

#Required firewall rules
resource "google_compute_firewall" "rules" {
  project     = var.project
  name        = "ai-opea-codegen-${random_id.rid.dec}"
  network     = "default"
  description = "Allows access to OPEA AI Code Generation"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "6379", "8001", "6006", "6007", "6000", "7000", "8808", "8000", "8888", "5173", "5174", "9009", "9000", "8028", "7778"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ai-opea-codegen-${random_id.rid.dec}"]
}
