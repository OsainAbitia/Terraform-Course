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
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  tags = {
    "Name"        = "practica-1"
    "environment" = "Dev"
  }
}
