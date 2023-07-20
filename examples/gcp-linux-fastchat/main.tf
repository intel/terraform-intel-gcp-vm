variable "project" {
  type        = string
  description = "project_id"
  default = "intel-csa-resource-gcp"
}

data "template_file" "user_data" {
  template = file("./cloud_init.yml")
}

data "template_file" "user_data_worker" {
  template = file("./cloud_init_worker.yml")
}

module "linux_vm" {
  source              = "../../"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-fastchat-test"
  zone                = "us-central1-a"
  machine_type        = "c3-highmem-8"
  network_ip          = "10.128.15.213"      
  tags                = ["fschat"]
  user_data    = data.template_file.user_data.rendered
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

module "linux_vm_n2" {
  source              = "../../"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-fastchat-older-node"
  zone                = "us-central1-a"
  machine_type        = "n2-highmem-8"
  network_ip          = "10.128.15.214"
  tags                = ["fschat"]
  user_data    = data.template_file.user_data_worker.rendered
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
  description = "Allows fastchat VMs to communicate"

  allow {
    protocol  = "tcp"
    ports     = ["21000-21020"]
  }

  source_tags = ["fschat"]
  target_tags = ["fschat"]
}