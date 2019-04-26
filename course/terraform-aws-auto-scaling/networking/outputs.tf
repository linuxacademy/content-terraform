#-----networking/outputs.tf
output "lab_vpc" {
  value = "${aws_vpc.tf_vpc.id}"
}

output "public_sb" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

output "private_sb" {
  value = "${aws_subnet.tf_private_subnet.*.id}"
}

output "private_sg" {
  value = "${aws_security_group.private_sg.id}"
}

output "public_sg" {
  value = "${aws_security_group.public_sg.id}"
}

output "public_subnet_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}

output "private_subnet_ips" {
  value = "${aws_subnet.tf_private_subnet.*.cidr_block}"
}
