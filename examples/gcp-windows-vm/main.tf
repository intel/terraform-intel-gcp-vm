module "windows_vm" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_family   = "windows-2019-core"
  boot_image_project  = "windows-cloud"
  name                = "this-is-a-windows-vm"
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}