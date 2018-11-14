resource "aws_iam_user" "admin" {
  name          = "${var.aws_account_name}-admin"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_policy" "admin_user" {
  name = "aws-console-${var.vault_iam_user}"
  user = "${aws_iam_user.admin.name}"

  policy = "${file("${path.module}/iam_roles/ec2_admin.json")}"

  depends_on = [
    "aws_iam_user.vault_iam_user",
  ]
}

resource "aws_iam_user_login_profile" "admin" {
  user    = "${aws_iam_user.admin.name}"
  pgp_key = "keybase:${var.keybase_user}"
}
