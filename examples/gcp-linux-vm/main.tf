module "linux-vm" {
  source              = "../../"
  project             = var.project
  boot_image_family   = "ubuntu-2004-lts"
  name                = "this-is-a-linux-vm"
  network             = "default"
  on_host_maintenance = "TERMINATE"
  access_config = [{
    nat_ip                 = var.nat_ip
    public_ptr_domain_name = var.public_ptr_domain_name
    network_tier           = var.network_tier
  }, ]
}