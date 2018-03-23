# Download the latest Ghost Image
module "image" {
  source = "./image"
  image  = "${lookup(var.image, var.env)}"
}

# Start the Container
module "container" {
  source   = "./container"
  image    = "${module.image.image_out}"
  name     = "${lookup(var.container_name, var.env)}"
  int_port = "${lookup(var.int_port, var.env)}"
  ext_port = "${lookup(var.ext_port, var.env)}"
}

#Output the IP Address of the Container
#output "IP Address" {
#  value = "${module.container.ip}"
#}

