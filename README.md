The script deploys a Ubuntu EC2 Instance within your AWS Environment with a single-node k3s cluster and sample Guestbook PHP web application and configures the Illumio Breach Containment Platform with segmentation policies to protect your K8s application.

# 1. Description

There are three directories and "steps" to this deployment
1) illumio_terraform_demo/illumio:      deploys Illumio resources
2) illumio_terraform_demo/aws:          deploys an AWS EC2 instance
3) illumio_terraform_demo/post-deploy:  performs post-deployment activities to onboard Kubernetes Cluster into Illumio

# 2. Requirements: 
- A Linux shell (if using Windows, you can load WSLv2)
- RSA SSH Keys generated using `ssh-keygen -t rsa` command to populate ~/.ssh/ directory (if not available)
- Terraform
- AWS CLI with credentials to AWS environment (ref. README.md in `aws` directory)

## 2.a. Generate RSA SSH Key (if not present)
### 2.a.1.Perform the following command to determine if your RSA (id_rsa and id_rsa.pub) SSH keys exist
```
ls ~/.ssh
```

The output should show the following two files:
id_rsa
id_rsa.pub
### 2.a.2. If these two files do not exist, perform the following to create your SSH keys using RSA:
```
ssh-keygen -t rsa
```
## 2.b. AWS CLI Setup
### Download AWS CLI Tool
#### Linux
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
#### Windows
Download and run the AWS CLI MSI installer for Windows (64-bit):
https://awscli.amazonaws.com/AWSCLIV2.msi
#### MacOS
```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```
## 2.c. Setup AWS CLI with credentials:
### 2.c.1. 
Login to the your AWS Console. 

### 2.c.2. 
Navigate to IAM > Users > Select User > Security Credentials Tab > Access Keys, select Create Access Key 

### 2.c.3. 
On the next screen, select Command Line Interface, click through to create the access key. 

### 2.c.4. 
Copy the Access key and Secret access key.

### 2.c.5. 
Configure AWS credentials using the following command:
```
aws configure
```
Populate prompts with AWS access key id, AWS secret access key, and AWS region. Leave the output format as blank (default is json)

# 3. Terraform Demo Deployment Steps

### 3.1. 
Clone this repository
```
git clone https://github.com/jyanagi/illumio_terraform_demo.git
```
### 3.2. 
Modify variables in `shared.tfvars`
NOTE: AMI ID is region specific!    
### 3.3.
Run the following command to initiate the deployment:

```
chmod +x deploy.sh
./deploy.sh
```

### 3.4. Access Resources
The Terraform scripts also generate an output of the public FQDN and IP address. When completed, copy either into your browser. You should be able to successfully access the guestbook web application.
