module "spot-vm" {
  source = "../../"
  # project             = var.project
  boot_image_family   = "ubuntu-2004-lts"
  name                = "this-is-a-spot-vm"
  network             = "default"
  on_host_maintenance = "TERMINATE"
  preemptible         = true
}