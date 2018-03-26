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

resource "null_resource" "null_id" {
  provisioner "local-exec" {
      command = "echo ${module.container.container_name}:${module.container.ip} >> container.txt"
  }
}


