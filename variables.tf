###############################################
# Module: AWS ELB 
###############################################


variable "elb_name" {}

variable "elb_is_internal" {
  description = "Determines if the ELB is internal or not"
  default = false
  // Defaults to false, which results in an external IP for the ELB
}

variable "elb_security_group" {}

variable "subnets" {
  description = "List of subnets"
}


variable "backend_port" {
  description = "The port the service on the EC2 instances listens on"
}

variable "backend_https_port" {
  description = "The port the service on the EC2 instances listens on"
}

variable "backend_protocol" {
 description = "The protocol the backend service speaks"
 // Possible options are
 // - http
 // - https
 // - tcp
 // - ssl (secure tcp)
}

variable "backend_https_protocol" {
 description = "The protocol the backend service speaks"
 default = ""
}

variable "health_check_target" {
  description = "The URL the ELB should use for health checks"
  // This is primarily used with `http` or `https` backend protocols
  // The format is like `HTTPS:443/health`
}

// See README.md for details on finding the
// ARN of an SSL certificate in EC2
variable "ssl_certificate_arn" {
  description = "The ARN of the SSL Certificate in EC2"
}

variable lb_https_port { default = "" }
variable lb_https_protocol { default = "" }


variable lb_port { default = "" }
variable lb_protocol { default = "" }
variable hc_healthy_threshold { default = "2" }
variable hc_unhealthy_threshold { default = "2" }
variable hc_timeout { default = "5" }
variable hc_interval { default = "6" }
variable cross_zone_load_balancing { default = true }
