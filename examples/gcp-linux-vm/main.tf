# You will need to provide value of the variable project, which is your GCP project id when you do terraform apply

module "linux_vm" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_family   = "ubuntu-2004-lts"
  name                = "this-is-a-linux-vm"
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}