#Create application Load Balancer
resource "aws_lb" "tf_lb" {
  name               = "tf_ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.alb_security_groups}"]
  subnets            = ["${var.public_subnets}"]

  enable_deletion_protection = true

  access_logs {
    bucket  = "${var.aws_bucket_elb_logs}"
    prefix  = "test-lb"
    enabled = true
  }

  tags {
    Environment = "production"
  }
}
