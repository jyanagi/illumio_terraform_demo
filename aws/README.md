The script deploys a Ubuntu EC2 Instance within your AWS Environment with a single-node k3s cluster and sample Guestbook PHP web application.

Requirements: 
- A Linux shell (if using Windows, you can load WSLv2)
- Terraform
- AWS CLI with credentials to AWS environment

# AWS CLI Setup

## Download AWS CLI Tool

### Linux
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

### Windows

Download and run the AWS CLI MSI installer for Windows (64-bit):
https://awscli.amazonaws.com/AWSCLIV2.msi

### MacOS
```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

## To setup AWS CLI with credentials:

Login to the your AWS Console. 

Navigate to IAM > Users > Select User > Security Credentials Tab > Access Keys, select Create Access Key 

On the next screen, select Command Line Interface, click through to create the access key. 

Copy the Access key and Secret access key into the `aws-access-key-id` and `aws_secret_access_key` fields in a new config that corresponds to the demo environment in the file ~/.aws/credentials 

You can also configure AWS credentials using the command 'aws configure'

Example `~/.aws/credentials` file:
```
[default]          
aws_access_key_id = ABCDEFGHIJKLMNOPQRST
aws_secret_access_key = ABC123DEF456GHI789JKL012MNO345PQR678STU90
```

# Terraform Deployment

There are two scripts within this directory: 
- k3s_install.sh
- helm_install.sh

These scripts are uploaded and remotely executed through the AWS Terraform Provider to download and install k3s and helm.

Additionally, a Guestbook K8s PHP application is deployed  within the `k3s_install.sh` file.

## Access Resources
The Terraform scripts also generate an output of the public FQDN and IP address. When completed, copy either into your browser. You should be able to successfully access the guestbook web application.
