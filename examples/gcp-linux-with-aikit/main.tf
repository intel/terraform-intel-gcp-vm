variable "project" {
  type        = string
  description = "project_id"
  default = "intel-csa-resource-gcp"
}

data "template_file" "user_data" {
  template = file("./cloud_init.yml")
}

module "linux_vm" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-terra-test"
  zone                = "us-central1-a"
  user_data    = data.template_file.user_data.rendered
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}
