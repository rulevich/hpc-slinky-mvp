data "aws_ami" "rocky9" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["Rocky-9-EC2-Base-9.*x86_64*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_security_group" "slinky" {
  name        = "${var.project_name}-sg"
  description = "Security group for Slinky MVP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from VPC/Ansible"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "Internal all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description = "Internal VPC traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.0.0/16"]
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

locals {
  instances = {
    k8sctl01    = "t3.small"
    k8sworker01 = "t3.small"
    k8sworker02 = "t3.small"
    k8sworker03 = "t3.small"
    storage01   = "t3.small"
  }
}

resource "aws_instance" "nodes" {
  for_each = local.instances

  ami                         = data.aws_ami.rocky9.id
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
