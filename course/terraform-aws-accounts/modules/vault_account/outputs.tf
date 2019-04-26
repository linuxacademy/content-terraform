output "console_password" {
  value = "${aws_iam_user_login_profile.admin.encrypted_password}"
}

output "console_user" {
  value = "${var.aws_account_name}-admin"
}
