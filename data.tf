#
#  Project specifc data from extant resources
#   * VPC
#   * Primary DNS host 
#
data "aws_route53_zone" "dns_host" {
  name = "${var.dns_host_name}"
  private_zone = false
}

data "aws_vpc" "this" {
  tags {
    Name = "${var.application}-${var.environment}"
  }
}

locals {
  host_zone_id = "${data.aws_route53_zone.dns_host.zone_id}"
  vpc_id = "${data.aws_vpc.this.id}"
}
