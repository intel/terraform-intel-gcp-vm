module "windows_vm" {
  source              = "../../"
  project             = var.project
  boot_image_family   = "windows-2019-core"
  boot_image_project  = "windows-cloud"
  name                = "this-is-a-windows-vm"
  network             = "default"
  on_host_maintenance = "TERMINATE"
}