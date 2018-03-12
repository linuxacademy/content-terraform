variable "aws_region" {}

# ---- root networking variables -----

variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "localip" {}

# -----root compute variables ---------

variable "key_name" {}

variable "public_key_path" {}

variable "server_instance_type" {}

variable "instance_count" {
  default = 1
}

#-----root storage variables -----
variable "project_name" {}
