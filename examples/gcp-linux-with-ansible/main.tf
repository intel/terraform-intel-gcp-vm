variable "project" {
  type        = string
  description = "project_id"
  default = "intel-csa-resource-gcp"
}

module "linux_vm" {
  source              = "./terraform-intel-gcp-vm"
  project             = var.project
  boot_image_family   = "ubuntu-2204-lts"
  name                = "this-is-a-linux-vm"
  zone                = "us-central1-a"
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}

resource "local_file" "ip" {
    content  = module.linux_vm.public_ip[0]
    filename = "ansible/ip.txt"
}

resource "null_resource" "null0" {
    depends_on = [local_file.ip]
    provisioner "local-exec" {
        command = "ansible-playbook ansible/main.yml"
    }
}