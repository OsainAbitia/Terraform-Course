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

resource "aws_s3_bucket" "platzi-backend" {
  bucket = var.bucket_name
  acl    = var.acl
  tags   = var.tags
}
