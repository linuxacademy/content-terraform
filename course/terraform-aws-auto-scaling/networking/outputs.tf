#-----networking/outputs.tf
output "lab_vpc" {
 value = "${aws_vpc.tf_vpc.id}"
}

output "public_sbs" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

output "private_sbs" {
  value = "${aws_subnet.tf_private_subnet.*.id}"
}
output "dev_sg" {
  value = "${aws_security_group.dev_sg.id}"
}

output "public_sg" {
  value = "${aws_security_group.public_sg.id}"
}

output "public_subnet_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}

output "dev_subnet_ips" {
  value = "${aws_subnet.tf_private_subnet.*.cidr_block}"
}

