variable "ami_id" {
  description = "AMI id de Linux 2"
  type        = string
}

variable "instance_type" {
  description = "Instance type to avoid costs"
}

variable "tags" {
  type = map(any)
}

variable "sg_name" {
  description = "Security groups for ssh conection"
}

variable "ingress_rules" {
  description = "Rule to access by SSH"
}
