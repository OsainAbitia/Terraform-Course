variable "ami_id" {
  default     = "ami-0ed9277fb7eb570c9"
  description = "AMI id de Linux 2"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type to avoid costs"
}

variable "tags" {
  type = map(any)
}
