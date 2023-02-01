module "spot-vm" {
  source              = "../../"
  boot_image_family   = "ubuntu-2004-lts"
  name                = "awesome-vm"
  network             = "default"
  on_host_maintenance = "TERMINATE"
}