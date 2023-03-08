module "spot_vm" {
  source                    = "../../"
  project                   = var.project
  boot_image_family         = "ubuntu-2004-lts"
  name                      = "this-is-a-spot-vm"
  on_host_maintenance       = "TERMINATE"
  preemptible               = true
  allow_stopping_for_update = true
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}