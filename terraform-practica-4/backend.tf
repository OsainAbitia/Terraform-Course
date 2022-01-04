terraform {
  backend "s3" {
    bucket     = "bucket-terraform-platzi-course"
    key        = "dev"
    region     = "us-east-1"
    encrypt    = true
    kms_key_id = "arn:aws:kms:us-east-1:131184176849:key/357e1d5e-0ad5-46ef-a9d7-c8d48b544184"
  }
}
