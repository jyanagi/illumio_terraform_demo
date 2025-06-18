data "terraform_remote_state" "aws" {
  backend = "local"
  config = {
    path = "../aws/terraform.tfstate"
  }
}

resource "null_resource" "post_deploy" {
  # Upload illumio-values.yaml
  provisioner "file" {
    source      = "illumio-values.yaml"
    destination = "/tmp/illumio-values.yaml"

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = data.terraform_remote_state.aws.outputs.k3s_public_ip
    }
  }

  # Upload kubelink_install.sh
  provisioner "file" {
    source      = "kubelink_install.sh"
    destination = "/tmp/kubelink_install.sh"

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = data.terraform_remote_state.aws.outputs.k3s_public_ip
    }
  }

  # Run kubelink_install.sh remotely
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/kubelink_install.sh",
      "sudo /tmp/kubelink_install.sh"
    ]

    connection {
      type        = "ssh"
      user        = var.ami_user
      private_key = file(var.private_key_path)
      host        = data.terraform_remote_state.aws.outputs.k3s_public_ip
    }
  }

  # Trigger re-run if instance_id changes
  triggers = {
    instance_id = data.terraform_remote_state.aws.outputs.ec2_instance_id
  }
}
