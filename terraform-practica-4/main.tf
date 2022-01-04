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

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt terraform state"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "platzi-backend" {
  bucket = var.bucket_name
  acl    = var.acl
  tags   = var.tags
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  force_destroy = true
}


output "arn" {
  value = aws_kms_key.mykey.arn
}
