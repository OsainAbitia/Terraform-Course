variable "bucket_name" {
  default = "bucket-terraform-platzi-course"
}

variable "acl" {
  default = "private"
}

variable "tags" {
  default = {
    Environment = "Dev",
    CreatedBy   = "terraform"
  }
}
