#----------storage/main.tf-------

# Create a random id 


# Create the bucket

resource "aws_s3_bucket" "tf_code" {
  bucket        = "${var.project_name}"
  acl           = "private"
  force_destroy = true

  tags {
    Name = "tf_bucket"
  }
}
