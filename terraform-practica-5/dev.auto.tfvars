ami_id        = "ami-0ed9277fb7eb570c9"
instance_type = "t2.micro"
tags          = { "Name" : "practica-1", "Environment" : "Dev" }
sg_name       = "Platzi-rules"
ingress_rules = [
  {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
