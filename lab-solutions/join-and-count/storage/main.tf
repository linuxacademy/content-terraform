#----------storage/main.tf-------

# Create a random id 

resource "random_id" "tf_bucket_id" {
  byte_length = 2
  count = 2

}

# Create the bucket

resource "aws_s3_bucket" "tf_code" {
  count         = 2
  bucket        = "${var.project_name}-${random_id.tf_bucket_id.*.dec[count.index]}"
  acl           = "private"
  force_destroy = true

  tags {
    Name = "tf_bucket"
  }
}
