You may need to change the appropriate IAM settings as described here: https://cloud.google.com/docs/terraform/get-started-with-terraform 

Next, enter the cloud shell in GCP (terminal button on top right of page) 

Run the following commands in order: 

git clone https://github.com/intel/terraform-intel-gcp-vm.git 

cd terraform-intel-gcp-vm 

git checkout amx 

cd terraform-intel-gcp-vm/examples/gcp-linux-with-ansible 

terraform init 

terraform apply 

Your VM should now be created. By default, it is called intel-terra-test. It takes about 30 minutes for everything to run (mainly the intel-aikit install) 

SSH into your VM from the cloud console. You can check if the install is complete by running cat /var/ansible-log and checking if the task “Reboot server” has run. 

To run the amx demo, run:

source /usr/local/bin/run_demo.sh 

 