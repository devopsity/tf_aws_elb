###############################################
# Module: AWS ELB
###############################################


// HTTP-HTTPS 


resource "aws_elb" "main" {
  name = "${var.elb_name}"
  subnets = ["${var.subnets}"]
  internal = "${var.elb_is_internal}"
  security_groups = ["${var.elb_security_group}"]

  listener {
    instance_port = "${var.backend_port}"
    instance_protocol = "${var.backend_protocol}"
    lb_port = "${var.lb_port}"
    lb_protocol = "${var.lb_protocol}"
  }

  listener {
    instance_port = "${var.backend_https_port}"
    instance_protocol = "${var.backend_https_protocol}"
    lb_port = "${var.lb_https_port}"
    lb_protocol = "${var.lb_https_protocol}"
    ssl_certificate_id = "${var.ssl_certificate_arn}"
  }

  health_check {
    healthy_threshold = "${var.hc_healthy_threshold}"
    unhealthy_threshold = "${var.hc_unhealthy_threshold}"
    timeout = "${var.hc_timeout}"
    target = "${var.health_check_target}"
    interval = "${var.hc_interval}"
  }

  cross_zone_load_balancing = "${var.cross_zone_load_balancing}"
}
