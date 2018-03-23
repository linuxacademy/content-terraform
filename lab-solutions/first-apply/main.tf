# Download the ghost:latest docker_image "image_id" to the system using a Terraform resource
resource "docker_image" "image_id" {
  name = "ghost:latest"
}

