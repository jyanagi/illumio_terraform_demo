provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "deployer" {
  key_name   = "k3s-key"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "k3s_sg" {
  name        = "k3s-sg"
  description = "Allow SSH, HTTP, HTTPS, and K8s API"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "k3s_node" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.k3s_sg.id]

  #user_data = file("k3s_install.sh")

  tags = {
    Name = "k3s-single-node"
  }
  
  # Upload guestbook yaml to /tmp directory
  provisioner "file" {
    source      = "guestbook-php.yaml"
    destination = "/tmp/guestbook-php.yaml"

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Upload k3s_install script to /tmp directory
  provisioner "file" {
    source      = "k3s_install.sh"
    destination = "/tmp/k3s_install.sh"

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Upload helm_install script to /tmp directory
  provisioner "file" {
    source      = "helm_install.sh"
    destination = "/tmp/helm_install.sh"

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Execute k3s_install script as root 
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/k3s_install.sh",
      "sudo /tmp/k3s_install.sh"
    ]

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Execute helm_install script as root 
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/helm_install.sh",
      "sudo /tmp/helm_install.sh"
    ]

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

}
