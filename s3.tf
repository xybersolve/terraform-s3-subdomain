#
#  Primary static website
#
resource "aws_s3_bucket" "site" {
  bucket = "${var.bucket_site}"
  acl = "public-read"
  policy = <<EOF
{
  "Id": "bucket_policy_${var.site_name}",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_${var.site_name}",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.bucket_site}/*",
      "Principal": "*"
    }
  ]
}
EOF
  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  logging {
    target_bucket = "${aws_s3_bucket.logs_site.id}"
    target_prefix = "root/"
  }

  tags {
    Name = "${var.application}-${var.environment}-${var.site_name}"
    Environment = "${var.environment}"
    Application = "${var.application}"
    Terraform = "True"
  }
  force_destroy = true
}
#
# Log bucket
#
resource "aws_s3_bucket" "logs_site" {
  bucket = "${var.bucket_logs}"
  region = "us-east-1"
  acl    = "log-delivery-write"

  tags {
    Name = "${var.application}-${var.environment}-logs.${var.site_name}"
    Environment = "${var.environment}"
    Application = "${var.application}"
    Terraform = "True"
  }
}
#
# Provisioning (web site content)
#
resource "null_resource" "website_content" {

  depends_on = ["aws_s3_bucket.site"]
  #
  #  Be sure to setup the web.conf.sh file correctly, prior ro applying
  #
  provisioner "local-exec" {
    command = "./web --upload"
  }
}
