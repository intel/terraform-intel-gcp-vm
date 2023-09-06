variable "project" {
  type        = string
  description = "project_id"
  default = "intel-csa-resource-gcp"
}

variable "controller_ip" {
  type        = string
  description = "IP of controller node"
  default = "10.128.15.213"
}

variable "worker_ip" {
  type        = string
  description = "IP of worker node"
  default = "10.128.15.214"

}

module "linux_vm" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-fastchat-test"
  zone                = "us-central1-a"
  machine_type        = "c3-highcpu-44"
  network_ip          = "10.128.15.213"      
  tags                = ["fschat"]
  user_data           = templatefile("./cloud_init.yml", {})
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

module "linux_vm_worker" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-fastchat-older-node"
  zone                = "us-central1-a"
  machine_type        = "custom-44-90112"
  network_ip          = "10.128.15.214"
  tags                = ["fschat"]
  user_data    =  templatefile("./cloud_init_worker.yml", { controller_ip = var.controller_ip, worker_ip = var.worker_ip })
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

resource "google_compute_firewall" "rules-1" {
  project     =  var.project
  name        = "fastchat-firewall"
  network     = "default"
  description = "Allows fastchat VMs to communicate"

  allow {
    protocol  = "tcp"
    ports     = ["21000-21020"]
  }

  source_tags = ["fschat"]
  target_tags = ["fschat"]
}

# Port 7860 is required to access the FastChat Webserver without proxying through gradio. Disabled by default.
resource "google_compute_firewall" "rules-2" {
  project     =  var.project
  name        = "fastchat-firewall-public-access"
  network     = "default"
  description = "Allows access to FastChat Webserver."
  disabled    = true # Remove this line or set to false to open up the webserver to traffic from port 7860

  allow {
    protocol  = "tcp"
    ports     = ["7860"]
  }
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = ["fschat"]
}
