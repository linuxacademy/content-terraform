#----root/outputs.tf-----

#----storage outputs------

output "Bucket Name" {
  value = "${module.storage.bucketname}"
}

#---Networking Outputs -----

#output "vpc_id" {
 # value = "${module.networking.lab_vpc}"
#}

#output "public_subnet" {
 # value = "${module.networking.public_subnets}"
#}

#output "private_subnet" {
 # value = "${module.networking.private_subnets}"
#}

output "Subnet_private_IPs" {
  value = "${module.networking.dev_subnet_ips}"
}

output "Subnet_public_IPs" {
  value = "${module.networking.public_subnet_ips}"
}


#output "nat_gateway" {
 # value = "${module.networking.nat_gateway}"
#}

#---Compute Outputs ------

output "dev Instance IDs" {
  value = "${module.compute.dev_instance_id}"
}

output "Bastion Instance IDs" {
  value = "${module.compute.bastion_instance_id}"
}

output "dev Instance IP" {
  value = "${module.compute.dev_ip}"
}

output "bastion Instance IP" {
  value = "${module.compute.bastion_ip}"
}
