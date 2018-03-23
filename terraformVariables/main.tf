variable "container_name" {
  description = "Name of container"
  default = "blog"
}
variable "image" {
  description = "image for container"
  default = "ghost:latest"
}
variable "int_port" {
  description = "internal port for container"
  default = "2368"
}
variable "ext_port" {
  description = "external port for container"
  default = "80"
}

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

