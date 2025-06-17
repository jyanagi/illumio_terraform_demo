output "k3s_public_ip" {
  value = aws_instance.k3s_node.public_ip
}

output "k3s_public_dns" {
  value = aws_instance.k3s_node.public_dns
}