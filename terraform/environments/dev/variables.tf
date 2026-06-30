variable "aws_region" {
  type    = string
  default = "il-central-1"
}

variable "project_name" {
  type    = string
  default = "hpc-slinky-mvp"
}

variable "key_name" {
  type    = string
  default = "HPC-KEY"
}

variable "vpc_id" {
  type    = string
  default = "vpc-01c35ba7d0fe37489"
}

variable "subnet_id" {
  type    = string
  default = "subnet-015c0e4a1de41dac6"
}

variable "allowed_vpc_cidr" {
  type    = string
  default = "172.31.0.0/16"
}
