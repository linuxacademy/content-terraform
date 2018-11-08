variable "aws_region" {}

variable "localip" {}

variable "public_subnets" {
 type = "list"
}

variable "private_subnets" {
 type = "list"
}

variable "subnet_count" {
 default = "2"
}

#variable "subnet_count" {
# default = "1"
#}

#variable "public_cidrs" {
 #type = "list"
#}

#variable "private_cidrs" { 
 #type = "list"
#}
variable "vpc_cidr" {
  default = "10.1.0.0/16"
}
variable "cidrs" {
  type = "list"
}
