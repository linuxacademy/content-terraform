# key pair
resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}


# create dev instance
resource "aws_instance" "dev" {
  instance_type = "${var.instance_type}"
  ami           = "${var.instance_ami}"

  tags {
    Name = "wordpress-instance"
  }

  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = ["${var.private_security_group}"]
  subnet_id              = "${element(var.private_subnets, count.index)}"

  provisioner "local-exec" {
    command = <<EOD
cat <<EOF > aws_hosts
[dev]
${aws_instance.dev.public_ip}
EOF
EOD
  }

  provisioner "local-exec" {
    command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.dev.id}  && ansible-playbook -i aws_hosts wordpress.yml"
  }
}

#craete Bastion host server
resource "aws_instance" "tf_bastion" {
  instance_type = "${var.instance_type}"
  ami           = "${var.instance_ami}"

  tags {
    Name = "tf_bastion"
  }

  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = ["${var.public_security_group}"]
  subnet_id              = "${element(var.public_subnets, count.index)}"
}
