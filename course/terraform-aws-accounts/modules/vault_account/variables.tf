variable "aws_account_name" {
  type = "string"
}

variable "default_lease_ttl" {
  type    = "string"
  default = "300"
}

variable "max_lease_ttl" {
  type    = "string"
  default = "600"
}

variable "vault_iam_user" {
  default = "vault"
}

variable "aws_account_id" {}

variable "aws_role_name" {}

variable "keybase_user" {}
