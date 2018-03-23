# Download the Docker Image
resource "docker_image" "image_id" {
  name = "${var.image}"
}
