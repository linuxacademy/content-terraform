# Download the latest Ghost image
resource "docker_image" "image_id" {
  name = "ghost:latest"
}

