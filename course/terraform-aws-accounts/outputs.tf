output "role_name" {
  value = "${module.aws_account.role_name}"
}

output "account_id" {
  value = "${module.aws_account.id}"
}

output "account_arn" {
  value = "${module.aws_account.arn}"
}

output "vault_ec2_ro_path" {
  value = "${var.aws_account_name}/aws/creds/ec2_ro"
}

output "vault_ec2_admin_path" {
  value = "${var.aws_account_name}/aws/creds/ec2_admin"
}

output "vault_ec2_admin_policy" {
  value = "${var.aws_account_name}-aws-admin"
}

output "vault_ec2_ro_policy" {
  value = "${var.aws_account_name}-aws-ro"
}

output "console_user" {
  value = "${module.iam_vault.console_user}"
}

output "console_password" {
  value = "${module.iam_vault.console_password}"
}
