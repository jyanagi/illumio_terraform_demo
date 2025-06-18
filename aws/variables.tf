variable "ami_id" {
  default = "ami-053b0d53c279acc90" # Ubuntu 22.04
}

variable "instance_type" {
  default = "t3.small"
}

variable "aws_region" {
  #default = "us-east-1"
  type = string
}

variable "public_key_path" {
  #default = "~/.ssh/id_rsa.pub"
  type = string
}

variable "private_key_path" {
  #default = "~/.ssh/id_rsa"
  type = string
}

variable "ami_user" {
    #default = "ec2-user"
    #default = "ubuntu"
    type = string
}
