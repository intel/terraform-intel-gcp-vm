You may need to change the appropriate IAM settings as described here: https://cloud.google.com/docs/terraform/get-started-with-terraform 

Next, enter the cloud shell in GCP (terminal button on top right of page) 

Run the following commands in order: 

`git clone https://github.com/intel/terraform-intel-gcp-vm.git`

`cd terraform-intel-gcp-vm`

`git checkout amx`

`cd terraform-intel-gcp-vm/examples/gcp-linux-fastchat` 

`terraform init` 

`terraform apply`


SSH into your VM from the cloud console.

To run the demo, run:

`python3 -m fastchat.serve.gradio_web_server --share` 

--- NEED TO FIX ---

This will fail, but it must run for the other commands to work.

run

`pip install gradio==3.10`
`pip install gradio==3.35.2`

`python3 -m fastchat.serve.gradio_web_server --share` 


and go to the gradio link

 