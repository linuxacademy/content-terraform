# Download the Docker Image
resource "docker_image" "image_id" {
  name = "${var.image}"
}

# Start the Container
module "container" {
  source   = "./container"
  image    = "${docker_image.image_id.latest}" 
  name     = "${var.container_name}"
  int_port = "${var.int_port}"
  ext_port = "${var.ext_port}"
}







resource "null_resource" "sg" {
  provisioner "local-exec" {
      command = "../lab-scripts/sg.sh"
  }
}



