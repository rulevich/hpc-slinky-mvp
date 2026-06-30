output "instance_private_ips" {
  value = {
    for name, instance in aws_instance.nodes :
    name => instance.private_ip
  }
}

output "instance_public_ips" {
  value = {
    for name, instance in aws_instance.nodes :
    name => instance.public_ip
  }
}

output "security_group_id" {
  value = aws_security_group.slinky.id
}

output "rocky_ami_id" {
  value = local.rocky9_ami_id
}
