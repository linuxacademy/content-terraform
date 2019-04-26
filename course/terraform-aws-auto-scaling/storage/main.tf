#----------storage/main.tf-------

# Create a random id 
resource "random_id" "tf_mybucket" {
  byte_length = 2
}

# Create the bucket
resource "aws_s3_bucket" "tf_code" {
  bucket        = "${var.project_name}-${random_id.tf_mybucket.dec}"
  acl           = "private"
  force_destroy = true

  tags {
    Name = "tf_mybucket"
  }
}
