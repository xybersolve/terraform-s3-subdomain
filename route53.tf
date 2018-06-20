#
#  Route53 Records for (site) and www.(site)
#
resource "aws_route53_record" "site" {
  name = "${var.site_name}"
  zone_id = "${local.host_zone_id}"
  type = "A"
  alias {
    name = "${aws_s3_bucket.site.website_domain}"
    zone_id = "${aws_s3_bucket.site.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "site_www" {
  name = "www.${var.site_name}"
  zone_id = "${local.host_zone_id}"
  type = "A"
  alias {
    name = "${aws_s3_bucket.site.website_domain}"
    zone_id = "${aws_s3_bucket.site.hosted_zone_id}"
    evaluate_target_health = false
  }
}
