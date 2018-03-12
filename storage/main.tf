#--------storage------------

#S3 code bucket

resource "random_id" "tf_code_bucket" {
  byte_length = 2
}

resource "aws_s3_bucket" "tf_code" {
  bucket        = "${var.project_name}-${random_id.tf_code_bucket.dec}"
  acl           = "private"
  force_destroy = true

  tags {
    Name = "tf_bucket"
  }
}
