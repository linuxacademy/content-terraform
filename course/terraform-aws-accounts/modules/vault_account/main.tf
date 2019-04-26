resource "aws_iam_user" "vault_iam_user" {
  name = "vault-iam-${var.vault_iam_user}"
}

resource "aws_iam_access_key" "vault_iam_user" {
  user = "${aws_iam_user.vault_iam_user.name}"

  depends_on = [
    "aws_iam_user.vault_iam_user",
  ]
}

resource "aws_iam_user_policy" "vault_iam_user" {
  name = "vault_auth-${var.vault_iam_user}"
  user = "${aws_iam_user.vault_iam_user.name}"

  policy = "${file("${path.module}/iam_roles/vault_iam_credentials.json")}"

  depends_on = [
    "aws_iam_user.vault_iam_user",
  ]
}

resource "vault_aws_secret_backend" "aws" {
  path                      = "${var.aws_account_name}/aws"
  access_key                = "${aws_iam_access_key.vault_iam_user.id}"
  secret_key                = "${aws_iam_access_key.vault_iam_user.secret}"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"

  depends_on = [
    "aws_iam_user.vault_iam_user",
  ]
}

# IAM Roles that Vault creates when aws backend is read with appropriate Vault Token
resource "vault_aws_secret_backend_role" "ec2_admin" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2_admin"
  policy  = "${file("${path.module}/iam_roles/ec2_admin.json")}"

  depends_on = [
    "vault_aws_secret_backend.aws",
  ]
}

resource "vault_aws_secret_backend_role" "ec2_ro" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2_ro"
  policy  = "${file("${path.module}/iam_roles/ec2_ro.json")}"

  depends_on = [
    "vault_aws_secret_backend.aws",
  ]
}