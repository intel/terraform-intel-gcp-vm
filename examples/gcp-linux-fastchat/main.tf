variable "project" {
  type        = string
  description = "project_id"
  default = "intel-csa-resource-gcp"
}

data "template_file" "user_data" {
  template = file("./cloud_init.yml")
}


module "linux_vm" {
  source              = "../../"
  project             = var.project
  boot_image_project  = "ubuntu-os-cloud"
  boot_image_family   = "ubuntu-2204-lts"
  name                = "intel-fastchat-test"
  zone                = "us-central1-a"
  machine_type        = "c3-highcpu-44"
  user_data    = data.template_file.user_data.rendered
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}
