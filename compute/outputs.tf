output "bastion_instance_id" {
  value = "${join(", ", aws_instance.tf_bastion.*.id)}"
}

output "bastion_public_ip" {
  value = "${join(", ", aws_instance.tf_bastion.*.public_ip)}"
}
