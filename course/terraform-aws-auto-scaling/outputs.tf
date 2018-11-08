#--------------storage/outputs.tf

output "bucket_name" {
  value = "${aws_s3_bucket.tf_code.id}"
}
