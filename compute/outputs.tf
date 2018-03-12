output "server_id" {
  value = "${join(", ", aws_instance.tf_server.*.id)}"
}

output "server_ip" {
  value = "${join(", ", aws_instance.tf_server.*.public_ip)}"
}
