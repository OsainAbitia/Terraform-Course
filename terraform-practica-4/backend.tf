terraform {
  backend "s3" {
    bucket = "bucket-terraform-platzi-course"
    key    = "dev"
    region = "us-east-1"
  }
}
