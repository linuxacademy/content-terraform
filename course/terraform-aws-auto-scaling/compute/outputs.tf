output "dev_instance_id" {
   value = "${aws_instance.dev.*.id}"
}

output "bastion_instance_id" {
   value = "${aws_instance.tf_bastion.*.id}"
}

output "bastion_ip" {
   value = "${aws_instance.tf_bastion.*.public_ip}"
}

output "dev_ip" {
   value = "${aws_instance.dev.*.private_ip}"
}
