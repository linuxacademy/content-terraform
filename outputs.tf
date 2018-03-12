#-----root networking outputs------

output "Public Subnets" {
  value = "${join(", ", module.networking.public_subnets)}"
}

output "Subnet IPs" {
  value = "${join(", ", module.networking.subnet_ips)}"
}

output "public Security Group" {
  value = "${module.networking.public_sg}"
}

# -------- root compute outputs -----------

output "public Instance IDs" {
  value = "${module.compute.server_id}"
}

output "Public Instance IPs" {
  value = "${module.compute.server_ip}"
}

# ------- root storage outputs ----------
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}
