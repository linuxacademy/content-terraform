variable "alb_security_groups" {
  description = "ALB security groups"
  type = "list"

variable "public_subnets" {
  description = "Public subnet use for alb"
  type = "list"
}

variable "aws_bucket_elb_logs" {
  description = "Bucket for alb logs"
  type = "list"
}
