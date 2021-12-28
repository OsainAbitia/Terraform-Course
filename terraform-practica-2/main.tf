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

resource "aws_instance" "platzi-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
}