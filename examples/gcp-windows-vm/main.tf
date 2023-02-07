module "windows_vm" {
  source              = "../../"
  project             = var.project
  boot_image_family   = "windows-2019-core"
  boot_image_project  = "windows-cloud"
  name                = "this-is-a-windows-vm"
  network             = "default"
  on_host_maintenance = "TERMINATE"
  access_config = [{
    nat_ip                 = var.nat_ip
    public_ptr_domain_name = var.public_ptr_domain_name
    network_tier           = var.network_tier
  }, ]
}