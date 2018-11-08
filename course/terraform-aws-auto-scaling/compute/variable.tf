variable "public_security_group" {} 

variable "private_security_group" {}
variable "private_subnets" {
 type = "list"
}

variable "public_subnets" { 
 type = "list"
}

variable "aws_region" {}
variable "aws_profile" {}
variable "localip" {}


variable "key_name" {}
variable "public_key_path" {}
variable "instance_type" {}
variable "instance_ami" {}
variable "cidrs" {
  type = "map"
}
