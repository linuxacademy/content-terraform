output "bucketname" {
  value = "${join(", ", aws_s3_bucket.tf_code.*.id)}"
}
