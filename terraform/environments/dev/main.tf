locals {
  instances = {
    k8sctl01    = "t3.small"
    k8sworker01 = "t3.small"
    k8sworker02 = "t3.small"
    k8sworker03 = "t3.small"
    storage01   = "t3.small"
  }

  rocky9_ami_id = "ami-0c38a49699e54e53a"
}

resource "aws_security_group" "slinky" {
  name        = "${var.project_name}-sg"
  description = "Security group for Slinky MVP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_vpc_cidr]
  }

  ingress {
    description = "Internal VPC traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.allowed_vpc_cidr]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-sg"
    Project = var.project_name
  }
}

resource "aws_instance" "nodes" {
  for_each = local.instances

  ami                         = local.rocky9_ami_id
  instance_type               = each.value
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.slinky.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 80
    volume_type = "gp3"
  }

  tags = {
    Name    = each.key
    Project = var.project_name
    Role    = each.key
  }
}
