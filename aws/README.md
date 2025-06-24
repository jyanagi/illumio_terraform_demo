The script deploys a Ubuntu EC2 Instance within your AWS Environment with a single-node k3s cluster and sample Guestbook PHP web application.

Requirements: 
- A Linux shell (if using Windows, you can load WSLv2)
- Terraform

# Terraform Deployment

There are two scripts within this directory: 
- k3s_install.sh
- helm_install.sh

These scripts are uploaded and remotely executed through the AWS Terraform Provider to download and install k3s and helm.

Additionally, a Guestbook K8s PHP application is deployed  within the `k3s_install.sh` file.

## Access Resources
The Terraform scripts also generate an output of the public FQDN and IP address. When completed, copy either into your browser. You should be able to successfully access the guestbook web application.





