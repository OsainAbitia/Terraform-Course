terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "cresendo"
  region  = "us-east-1"
}

resource "aws_security_group" "ssh_conection" {
  name        = var.sg_name
  description = "Allow ssh inbound traffic"
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

resource "aws_instance" "platzi-instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  tags            = var.tags
  security_groups = [aws_security_group.ssh_conection.name]
}

