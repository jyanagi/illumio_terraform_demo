# AWS Variables

variable "aws_region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "ami_user" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "private_key_path" {
  type = string
}

# Illumio Variables

variable "pce_url" {
  type = string
}

variable "pce_org_id" {
  type = string
}

variable "pce_api_key" {
  type = string
}

variable "pce_api_secret" {
  type = string
}

