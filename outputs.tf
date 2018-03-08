#-----root networking outputs------

output "Public Subnets" {
  value = "${join(", ", module.networking.public_subnets)}"
}

output "Subnet IPs" {
  value = "${module.networking.subnet_ips}"
}

output "Bastion Security Group" {
  value = "${module.networking.bastion_sg}"
}

# -------- root compute outputs -----------

output "Bastion Instance IDs" {
  value = "${module.compute.bastion_instance_id}"
}

output "Bastion Public IPs" {
  value = "${module.compute.bastion_public_ip}"
}

# ------- root storage outputs ----------
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}
