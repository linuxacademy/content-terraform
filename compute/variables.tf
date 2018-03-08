variable "key_name" {}

variable "public_key_path" {}

variable "instance_type" {}

variable "ami" {}

variable "security_group" {}

variable "subnets" {
  type = "list"
}

variable "instance_count" {}

variable "subnet_ips" {
  type = "list"
}
