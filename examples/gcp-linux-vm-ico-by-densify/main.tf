# --------------------------------------------------------
#                     _       _       _
#                    (_)     | |     | |
#                     _ _ __ | |_ ___| |
#                    | | '_ \| __/ _ \ |
#                    | | | | | ||  __/ |
#                    |_|_| |_|\__\___|_|
# --------------------------------------------------------

# ICO by Densify module
module "densify" {
  source  = "densify-dev/optimization-as-code/null"
  densify_recommendations = var.densify_recommendations
  densify_fallback = var.densify_fallback
  # In this sample we are using the system name as the unique idenifier but if you had multiple systems that had the same name this should be set uniquely to make sure the correct recommendations are set\applied for each system.
  densify_unique_id = var.name
}

# Intel module
# Provision GCP Xeon 4th Generation Scalable processors (code-named Sapphire Rapids) VM
# You will need to provide value of the variable project, which is your GCP project id when you do terraform apply
module "linux_vm" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_family   = "ubuntu-2204-lts"
  name                = var.name
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]

  # ICO by Densify - normal way of sizing an instance by hardcoding the size.
  #machine_type = "n1-standard-2"

  # ICO by Densify - new self-optimizing instance type from Densify
  machine_type = module.densify.instance_type
  
 }

