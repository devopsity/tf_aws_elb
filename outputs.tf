###############################################
# Module: AWS ELB Output
###############################################

output "id" {
  value = "${aws_elb.main.id}"
}

output "name" {
  value = "${aws_elb.main.name}"
}

output "dns_name" {
  value = "${aws_elb.main.dns_name}"
}