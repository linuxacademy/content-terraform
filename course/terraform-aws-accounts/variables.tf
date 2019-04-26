variable "aws_account_name" {
  type = "string"
}

variable "aws_account_email" {
  type = "string"
}

variable "aws_account_role" {
  type    = "string"
  default = ""
}

variable "keybase_user" {}

variable "iam_user_access_to_billing" {
  default = true
  type = "string"
  description = "Allow IAM User Access to Billing"
}
