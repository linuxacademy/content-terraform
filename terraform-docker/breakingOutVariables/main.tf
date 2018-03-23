# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "${var.image}"
}
# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.container_name}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
}
#Output the IP Address of the Container
output "IP Address" {
  value = "${docker_container.container_id.ip_address}"
}
output "container_name" {
  value = "${docker_container.container_id.name}"
}

