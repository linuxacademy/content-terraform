output "arn" {
  value = "${aws_organizations_account.account.arn}"
}

output "id" {
  value = "${aws_organizations_account.account.id}"
}

output "role_name" {
  value = "${length(var.aws_account_role) > 0 ? var.aws_account_role : "${var.aws_account_name}-admin"}"
}
