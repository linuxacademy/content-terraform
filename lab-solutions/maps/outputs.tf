#Output the IP Address of the Container
output "IP Address" {
  value = "${module.container.ip}"
}

output "Container Name" {
  value = "${module.container.container_name}"
}
