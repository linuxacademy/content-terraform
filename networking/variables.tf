data "aws_availability_zones" "available" {}

variable "vpc_cidr" {
  #default = "10.123.0.0/16"
}

variable "public_cidrs" {
  type = "list"
}

variable "localip" {
  #default = "0.0.0.0/0"
}
