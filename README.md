The script deploys a Ubuntu EC2 Instance within your AWS Environment with a single-node k3s cluster and sample Guestbook PHP web application and configures the Illumio Breach Containment Platform with segmentation policies to protect your K8s application.

# Description

There are three directories and "steps" to this deployment
1) illumio_terraform_demo/illumio:      deploys Illumio resources
2) illumio_terraform_demo/aws:          deploys an AWS EC2 instance
3) illumio_terraform_demo/post-deploy:  performs post-deployment activities to onboard Kubernetes Cluster into Illumio

## Requirements: 
- A Linux shell (if using Windows, you can load WSLv2)
- Terraform
- AWS CLI with credentials to AWS environment (ref. README.md in `aws` directory)

# Terraform Demo Deployment Steps

Run the following command to initiate the deployment:

Modify variables in `shared.tfvars`

```
git clone https://github.com/jyanagi/illumio_terraform_demo.git
chmod +x deploy.sh
./deploy.sh
```

## Access Resources
The Terraform scripts also generate an output of the public FQDN and IP address. When completed, copy either into your browser. You should be able to successfully access the guestbook web application.
