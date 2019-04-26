variable "aws_region" {
  default = "us-east-2"
}

variable "aws_access_key" {
  default = "AKIAIXHQBCWXBDVVFBZQ"
}

variable "aws_secret_key" {
  default = "e4TciDI1JUqBB874bJEP4yz6Cuj9rCnyrUjxqWvy"
}

variable "aws_profile" {
  default = "robino"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_count" {
  default = "2"
}

variable "public_subnet_cidrs" {
  default = [
    "10.100.1.0/24",
    "10.100.2.0/24",
  ]
}

variable "private_subnet_cidrs" {
  default = [
    "10.100.3.0/24",
    "10.100.4.0/24",
  ]
}

variable "public_elastic_ip" {
  default = "0.0.0.0/0"
}

variable "accessip" {
  default = "0.0.0.0/0"
}
