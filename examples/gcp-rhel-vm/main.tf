# --------------------------------------------------------
#                     _       _       _
#                    (_)     | |     | |
#                     _ _ __ | |_ ___| |
#                    | | '_ \| __/ _ \ |
#                    | | | | | ||  __/ |
#                    |_|_| |_|\__\___|_|
# --------------------------------------------------------
# Provision GCP Xeon 4th Generation Scalable processors (code-named Sapphire Rapids) VM
# You will need to provide value of the variable project, which is your GCP project id when you do terraform apply
module "rhel_vm" {
  source             = "intel/gcp-vm/intel"
  project            = var.project
  boot_image_family  = "rhel-8"
  boot_image_project = "rhel-cloud"
  name               = "vm1"
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}
