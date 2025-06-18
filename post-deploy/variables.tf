variable "aws_region" {
  default = "us-east-1"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  default = "~/.ssh/id_rsa"
}

variable "ami_user" {
    #default = "ec2-user"
    default = "ubuntu"
}
