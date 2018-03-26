# Download the ghost:latest docker_image "image_id" to the system using a Terraform resource



resource "null_resource" "sg" {
  provisioner "local-exec" {
      command = "../lab-scripts/sg.sh"
  }
}