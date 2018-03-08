# ----- root tfvars -----

aws_region = "us-east-1"

vpc_cidr = "10.123.0.0/16"

public_cidrs			= [
  "10.123.1.0/24",
  "10.123.2.0/24"
]
private_cidrs = [
  "10.123.3.0/24",
  "10.123.4.0/24"
]

localip = "0.0.0.0/0"

key_name = "key"

public_key_path = "~/.ssh/keypair.pub"

bastion_instance_type = "t2.micro"

bastion_ami = "ami-22ce4934"

instance_count = 2

project_name = "la-terraform"


