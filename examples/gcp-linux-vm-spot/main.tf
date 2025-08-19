# --------------------------------------------------------
#                     _       _       _
#                    (_)     | |     | |
#                     _ _ __ | |_ ___| |
#                    | | '_ \| __/ _ \ |
#                    | | | | | ||  __/ |
#                    |_|_| |_|\__\___|_|
# --------------------------------------------------------
# Provision GCP Xeon 5th Generation Scalable processors (code-named Emerald Rapids) VM
# You will need to provide value of the variable project, which is your GCP project id when you do terraform apply
module "spot_vm" {
  source                    = "intel/gcp-vm/intel"
  project                   = var.project
  boot_image_family         = "ubuntu-2204-lts"
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
