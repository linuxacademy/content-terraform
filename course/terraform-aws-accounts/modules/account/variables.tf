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

variable "iam_user_access_to_billing" {
  type = "string"
  default = true
  description = "Allow IAM User access to billing"
}
