module "aws_account" {
  source            = "./modules/account"
  aws_account_name  = "${var.aws_account_name}"
  aws_account_email = "${var.aws_account_email}"
  aws_account_role  = "${var.aws_account_role}"
  iam_user_access_to_billing = "${var.iam_user_access_to_billing}"
}

module "iam_vault" {
  source           = "./modules/vault_account"
  aws_account_id   = "${module.aws_account.id}"
  aws_role_name    = "${module.aws_account.role_name}"
  aws_account_name = "${var.aws_account_name}"
  keybase_user     = "${var.keybase_user}"
}
