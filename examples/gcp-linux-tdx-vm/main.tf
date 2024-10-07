# --------------------------------------------------------
#                     _       _       _
#                    (_)     | |     | |
#                     _ _ __ | |_ ___| |
#                    | | '_ \| __/ _ \ |
#                    | | | | | ||  __/ |
#                    |_|_| |_|\__\___|_|
# --------------------------------------------------------
# Provision GCP virtual machine on Intel Xeon 4th Generation Scalable processors (code-named Sapphire Rapids) VM which supports Confidential Computing with Intel Trust Domain Extension (Intel TDX) technology
# You will need to provide value of the variable project, which is your GCP project id when you do terraform apply
module "linux_vm" {
  #source              = "intel/gcp-vm/intel"
  source              = "../../"
  project             = var.project
  name                = "ds-tdx-linux01"
 
 #required for Intel Confidential Compute VM with TDX
 enable_confidential_compute = var.enable_confidential_compute
 confidential_instance_type  = var.confidential_instance_type
 on_host_maintenance = "TERMINATE"

 access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}
