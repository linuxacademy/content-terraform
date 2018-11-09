#----alb/outputs.tf

output "alb_id" {
  value = "${aws_lb.tf_lb.id}"
}
