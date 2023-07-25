This demo will demonstrate the 1.3x speedup in Large Language Model CPU inference from 3rd gen Xeon to 4th gen Xeon

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

Ssh into the c3 instance and run

`python3 -m fastchat.serve.gradio_web_server_multi --share` 

--- KNOWN ISSUE ---

This may fail. In this case, run

`pip install gradio==3.10`
`pip install gradio==3.35.2`

Then, run:

`python3 -m fastchat.serve.gradio_web_multi --share` 


and go to the gradio link

 
